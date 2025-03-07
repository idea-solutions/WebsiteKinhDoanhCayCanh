﻿using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Helpers;
using System.Web.Mvc;
using WebsiteKinhDoanhCayCanh.Message;
using WebsiteKinhDoanhCayCanh.Models;

namespace WebsiteKinhDoanhCayCanh.Controllers
{
    public class UsersController : Controller
    {
        // GET: Users
        private ApplicationDbContext db = new ApplicationDbContext();

        [Authorize]
        //Get: getvoucher
        public ActionResult XemVoucher()
        {
            MyDataEF myData = new MyDataEF();
            var id_currentUser = System.Web.HttpContext.Current.User.Identity.GetUserId();

            return View(myData.UserVoucher.Where(p => p.id_User == id_currentUser).ToList());
        }

        //Get : addvoucher
        public string SaveVoucher(string id_Voucher)
        {
            try
            {
                var id_currentUser = System.Web.HttpContext.Current.User.Identity.GetUserId();
                UserVoucher addUserVoucher = new UserVoucher();
                addUserVoucher.id_User = id_currentUser;
                addUserVoucher.id_voucher = id_Voucher;
                addUserVoucher.soLuotConLai = 1;
                MyDataEF myData = new MyDataEF();
                myData.UserVoucher.Add(addUserVoucher);
                myData.SaveChanges();
                return id_Voucher;
            }
            catch (Exception)
            {
                return "Error";
            }

        }
        [Authorize]
        public ActionResult ChangeStatusAccount(string id_User)
        {
            if (System.Web.HttpContext.Current.User.Identity.GetUserId() == id_User)
            {
                Notification.set_flash("Không thể khóa tài khoản đang đăng nhập!", "error");
                return RedirectToAction("IndexAdmin", "Users");
            }
            var user = db.Users.Find(id_User);
            if (user == null)
            {
                return HttpNotFound();
            }
            user.LockoutEnabled = !user.LockoutEnabled;
            db.SaveChanges();
            if (user.Roles.Where(p => p.RoleId == "1").FirstOrDefault() != null)
            {
                return RedirectToAction("IndexAdmin", "Users");
            }
            return RedirectToAction("Index", "Users");
        }

        // GET: Users
        /*[Authorize]
        public ActionResult Index(int? page, string searchString)
        {
            if (!AuthAdmin())
                return RedirectToAction("Error401", "Admin");
            ViewBag.Keyword = searchString;
            //var all_user = db.Users.Where(u => u.Roles.FirstOrDefault(r => r.UserId == u.Id).RoleId != "1").ToList();
            int pageSize = 10;
            int pageNum = page ?? 1;
            return View(ApplicationUser.getAll(searchString).ToPagedList(pageNum, pageSize));
        }*/

        [Authorize]
        public ActionResult Index(string searchString)
        {
            if (!AuthAdmin())
                return RedirectToAction("Error401", "Admin");
            ViewBag.Keyword = searchString;
            //var all_user = db.Users.Where(u => u.Roles.FirstOrDefault(r => r.UserId == u.Id).RoleId != "1").ToList();

            return View(ApplicationUser.getAll(searchString));
        }
        /*[Authorize]
         * public ActionResult IndexAdmin(int? page, string searchString)
        {
            if (!AuthAdmin())
                return RedirectToAction("Error401", "Admin");
            ViewBag.Keyword = searchString;
            //var all_user = db.Users.Where(u => u.Roles.FirstOrDefault(r => r.UserId == u.Id).RoleId != "1").ToList();
            int pageSize = 10;
            int pageNum = page ?? 1;
            return View(ApplicationUser.getAllAdmin(searchString).ToPagedList(pageNum, pageSize));
        }*/

        [Authorize]
        public ActionResult IndexAdmin(string searchString)
        {
            if (!AuthAdmin())
                return RedirectToAction("Error401", "Admin");
            ViewBag.Keyword = searchString;

            return View(ApplicationUser.getAllAdmin(searchString));
        }
        // GET: Users/Details
        public ActionResult Details(string id)
        {
            if (!AuthAdmin())
                return RedirectToAction("Error401", "Admin");
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ApplicationUser applicationUser = db.Users.Find(id);
            if (applicationUser == null)
            {
                return HttpNotFound();
            }
            return View(applicationUser);
        }

        // GET: Users/Create
        public ActionResult Create()
        {
            if (!AuthAdmin())
                return RedirectToAction("Error401", "Admin");
            return View();
        }

        // POST: Users/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Name,Address,Email,EmailConfirmed,PasswordHash,SecurityStamp,PhoneNumber,PhoneNumberConfirmed,TwoFactorEnabled,LockoutEndDateUtc,LockoutEnabled,AccessFailedCount,UserName")] ApplicationUser applicationUser)
        {
            if (!AuthAdmin())
                return RedirectToAction("Error401", "Admin");
            if (ModelState.IsValid)
            {

                db.Users.Add(applicationUser);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(applicationUser);
        }

        // GET: Users/Edit
        [Authorize]
        public ActionResult Edit(string id)
        {
            if (!AuthAdmin())
                return RedirectToAction("Error401", "Admin");
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ApplicationUser applicationUser = db.Users.Find(id);
            if (applicationUser == null)
            {
                return HttpNotFound();
            }
            return View(applicationUser);
        }

        // POST: Users/Edit
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,FullName,Address,Email,EmailConfirmed,PasswordHash,SecurityStamp,PhoneNumber,PhoneNumberConfirmed,TwoFactorEnabled,LockoutEndDateUtc,LockoutEnabled,AccessFailedCount,UserName")] ApplicationUser applicationUser)
        {
            if (!AuthAdmin())
                return RedirectToAction("Error401", "Admin");
            if (ModelState.IsValid)
            {
                //db.Entry(applicationUser).State = EntityState.Modified;
                ApplicationUser user = db.Users.FirstOrDefault(u => u.UserName == applicationUser.UserName);
                user.FullName = applicationUser.FullName;
                user.Address = applicationUser.Address;
                user.Email = applicationUser.Email;
                user.PhoneNumber = applicationUser.PhoneNumber;
                user.LockoutEnabled = applicationUser.LockoutEnabled;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(applicationUser);
        }

        // GET: Users/Delete
        public ActionResult Delete(string id)
        {
            if (!AuthAdmin())
                return RedirectToAction("Error401", "Admin");
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ApplicationUser applicationUser = db.Users.Find(id);
            if (applicationUser == null)
            {
                return HttpNotFound();
            }
            return View(applicationUser);
        }

        // POST: Users/Delete
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            if (!AuthAdmin())
                return RedirectToAction("Error401", "Admin");
            ApplicationUser applicationUser = db.Users.Find(id);
            db.Users.Remove(applicationUser);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        public bool AuthAdmin()
        {
            var user = db.Users.FirstOrDefault(u => u.UserName == User.Identity.Name);
            if (user == null)
                return false;
            var userExist = user.Roles.FirstOrDefault(r => r.UserId == user.Id);
            if (userExist == null)
                return false;
            if (userExist.RoleId != "1")
                return false;
            return true;
        }

        [Authorize]
        public ActionResult userDetail()
        {
            ApplicationUser userLogin = System.Web.HttpContext.Current.GetOwinContext().GetUserManager<ApplicationUserManager>().FindById(System.Web.HttpContext.Current.User.Identity.GetUserId());
            ViewBag.idUser = userLogin.Id;
            return View();
        }

        [HttpGet]
        public JsonResult getUserDetail()
        {
            try
            {
                ApplicationUser userLogin = System.Web.HttpContext.Current.GetOwinContext().GetUserManager<ApplicationUserManager>().FindById(System.Web.HttpContext.Current.User.Identity.GetUserId());
                return Json(new { code = 200, userLogin = userLogin }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new { code = 500, msg = "Lấy thông tin cá nhân thất bại !" + ex.Message }, JsonRequestBehavior.AllowGet);
            }
        }

        [HttpPost]
        public JsonResult editName(string id, string name)
        {
            try
            {
                var user = db.Users.SingleOrDefault(x => x.Id == id);
                user.FullName = name;
                db.SaveChanges();

                return Json(new { code = 200, msg = "Cật nhật tên thành công !", typemsg = "success" }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new { code = 500, msg = "Cật nhật tên thất bại !" + ex.Message, typemsg = "error" }, JsonRequestBehavior.AllowGet);

            }
        }

        [HttpPost]
        public JsonResult editAddress(string id, string address)
        {
            try
            {
                var user = db.Users.SingleOrDefault(x => x.Id == id);
                user.Address = address;
                db.SaveChanges();

                return Json(new { code = 200, msg = "Cật nhật địa chỉ thành công !", typemsg = "success" }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new { code = 500, msg = "Cật nhật địa chỉ thất bại !" + ex.Message, typemsg = "error" }, JsonRequestBehavior.AllowGet);

            }
        }

        [HttpPost]
        public JsonResult editPhone(string id, string phone)
        {
            try
            {
                var user = db.Users.SingleOrDefault(x => x.Id == id);
                user.PhoneNumber = phone;
                db.SaveChanges();

                return Json(new { code = 200, msg = "Cật nhật số điện thoại thành công !", typemsg = "success" }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new { code = 500, msg = "Cật nhật số điện thoại thất bại !" + ex.Message, typemsg = "error" }, JsonRequestBehavior.AllowGet);

            }
        }
        [HttpPost]
        public JsonResult changePassword(string id, string oldPassword, string newPassword)
        {
            try
            {
                var user = db.Users.SingleOrDefault(x => x.Id == id);
                if (Crypto.VerifyHashedPassword(user.PasswordHash, oldPassword))
                {
                    user.PasswordHash = Crypto.HashPassword(newPassword);
                    db.SaveChanges();
                    return Json(new { code = 200, msg = "Thay đổi mật khẩu thành công !", typemsg = "success" }, JsonRequestBehavior.AllowGet);
                }
                else
                {
                    return Json(new { code = 400, msg = "Mật khẩu cũ không chính xác !", typemsg = "error" }, JsonRequestBehavior.AllowGet);
                }

            }
            catch (Exception ex)
            {
                return Json(new { code = 500, msg = "Thay đổi mật khẩu  thất bại !" + ex.Message, typemsg = "error" }, JsonRequestBehavior.AllowGet);

            }
        }
    }
}