//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace OfficeBook.Data.DataModels
{
    using Dapper.Contrib.Extensions;
    using System;
    using System.Collections.Generic;
    
    public partial class ob_announcements
    :IEntity{
        public int Id { get; set; }
        public string Message { get; set; }
        public int PostId { get; set; }
    }
}
