using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MPDMA.Models
{
    public class Film
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string? Desc { get; set; }
        public string Release { get; set; }
    }
}
