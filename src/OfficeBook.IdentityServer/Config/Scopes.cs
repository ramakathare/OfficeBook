using IdentityModel;
using IdentityServer4.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace OfficeBook.IdentityServer.Config
{
    internal class Scopes
    {
        public static IEnumerable<Scope> Get()
        {
            return new List<Scope> {
            StandardScopes.OpenId,
            StandardScopes.Profile,
            StandardScopes.Email,
            StandardScopes.Roles,
            StandardScopes.OfflineAccess,
            //new Scope {
            //        Name = "customAPI",
            //        DisplayName = "Custom API",
            //        Description = "Custom API scope",
            //        Type = ScopeType.Resource,
            //        Claims = new List<ScopeClaim> {
            //            new ScopeClaim(JwtClaimTypes.Role)
            //        },
            //        ScopeSecrets =  new List<Secret> {
            //            new Secret("scopeSecret".Sha256())
            //        }
            //    }
            //};

            new Scope
                {
                    Name = "OfficeBook.WebApi",
                    DisplayName = "OfficeBook Web API Access",
                    Description = "My API",
                    ScopeSecrets = new List<Secret>
                    {
                        new Secret("1BCB6C91-533F-43EA-9CE4-4A1EE960BA2F".Sha256())
                    },
                    Claims = new List<ScopeClaim>()
                    {
                        new ScopeClaim(JwtClaimTypes.Role)
                    }
            }
            };
        }
    }
}
