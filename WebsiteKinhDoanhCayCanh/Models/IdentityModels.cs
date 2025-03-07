﻿using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;

namespace WebsiteKinhDoanhCayCanh.Models
{
    // You can add profile data for the user by adding more properties to your ApplicationUser class, please visit https://go.microsoft.com/fwlink/?LinkID=317594 to learn more.
    public class ApplicationUser : IdentityUser
    {

        public string FullName { get; set; }
        public string Address { get; set; }
        public static List<ApplicationUser> getAll(string searchKey)
        {
            ApplicationDbContext db = new ApplicationDbContext();
            searchKey = searchKey + "";
            return db.Users.Where(p => p.Email.Contains(searchKey) && p.Roles.FirstOrDefault(r => r.UserId == p.Id).RoleId != "1").ToList();
        }
        public static List<ApplicationUser> getAllAdmin(string searchKey)
        {
            ApplicationDbContext db = new ApplicationDbContext();
            searchKey = searchKey + "";
            return db.Users.Where(p => p.Email.Contains(searchKey) && p.Roles.FirstOrDefault(r => r.UserId == p.Id).RoleId == "1").ToList();
        }
        public async Task<ClaimsIdentity> GenerateUserIdentityAsync(UserManager<ApplicationUser> manager)
        {
            // Note the authenticationType must match the one defined in CookieAuthenticationOptions.AuthenticationType
            var userIdentity = await manager.CreateIdentityAsync(this, DefaultAuthenticationTypes.ApplicationCookie);
            // Add custom user claims here
            return userIdentity;
        }
    }

    public class ApplicationDbContext : IdentityDbContext<ApplicationUser>
    {
        public ApplicationDbContext()
            : base("DefaultConnection", throwIfV1Schema: false)
        {
        }

        protected override void OnModelCreating(System.Data.Entity.DbModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            modelBuilder.Entity<ApplicationUser>().ToTable("Users");
            modelBuilder.Entity<IdentityUserRole>().ToTable("UserRoles");
            modelBuilder.Entity<IdentityUserLogin>().ToTable("UserLogins");
            modelBuilder.Entity<IdentityUserClaim>().ToTable("UserClaims");
            modelBuilder.Entity<IdentityRole>().ToTable("Roles");
        }

        public static ApplicationDbContext Create()
        {
            return new ApplicationDbContext();
        }

    }
}