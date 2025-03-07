﻿namespace WebsiteKinhDoanhCayCanh.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;
    using System.Linq;

    [Table("ThongTinThemVeSP")]
    public partial class ThongTinThemVeSP
    {
        [Key]
        [StringLength(10)]

        public string id_SP { get; set; }

        [StringLength(255)]
        [Required(ErrorMessage = "Nhập thiếu!")]
        public string congDung { get; set; }

        [StringLength(255)]
        [Required(ErrorMessage = "Nhập thiếu!")]
        public string cachTrong { get; set; }

        public virtual SanPham SanPham { get; set; }
        public static List<ThongTinThemVeSP> getAll()
        {
            MyDataEF db = new MyDataEF();
            return db.ThongTinThemVeSP.ToList();
        }
    }
}
