namespace WebsiteKinhDoanhCayCanh.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;
    using System.Linq;

    [Table("DonHang")]
    public partial class DonHang
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public DonHang()
        {
            CTDH = new HashSet<CTDH>();
        }

        [Key]
        public int id_DH { get; set; }

        [Column(TypeName = "date")]
        public DateTime? ngayDat { get; set; }

        [Column(TypeName = "date")]
        public DateTime? ngayGiao { get; set; }

        public Boolean trangThaiThanhToan { get; set; }

        [StringLength(1)]
        public string trangThaiGiaoHang { get; set; }

        [StringLength(1)]
        public string phuongThucThanhToan { get; set; }

        public long? tongTien { get; set; }

        [StringLength(250)]
        public string diaChiGiao { get; set; }

        [StringLength(128)]
        public string id_User { get; set; }

        [StringLength(10)]
        public string id_Voucher { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CTDH> CTDH { get; set; }

        public virtual Voucher Voucher { get; set; }
        //public virtual ICollection<ApplicationUser> Users { get; set; }

        /*        public static List<DonHang> getAll(String searchKey)
                {
                    MyDataEF db = new MyDataEF();
                    searchKey = searchKey + "";
                    //List<ChiTietDonHang> list = db.ChiTietDonHang.Where(a => a.SanPham.Ten.Contains(keyWord) && a.Soluong > 0).ToList();
                    //return db.DonHang.ToList();
                    return db.DonHang.Where(p => p.diaChiGiao.Contains(searchKey)).ToList();
                }*/
    }
}
