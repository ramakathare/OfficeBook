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
    
    public partial class ob_groups
    :IEntity{
        public int Id { get; set; }
        public string Name { get; set; }
        public string Handle { get; set; }
        public string Desc { get; set; }
     
    	[Write(false)] 
        public System.DateTime CreatedOn { get; set; }
        public int Creator { get; set; }
     
    	[Write(false)] 
        public System.DateTime EditedOn { get; set; }
        public int Editor { get; set; }
    }
}
