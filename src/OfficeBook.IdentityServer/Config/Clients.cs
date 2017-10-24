using IdentityModel;
using IdentityServer4.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace OfficeBook.IdentityServer.Config
{
    internal class Clients
    {
        public static IEnumerable<Client> Get()
        {
            return new List<Client> {
                new Client
                {
                    ClientId = "OfficeBook.App",
                    ClientName = "OfficeBook App Client",
                    AllowedGrantTypes = GrantTypes.Implicit,
                    AllowAccessTokensViaBrowser = true,
                    AccessTokenType = AccessTokenType.Reference,
                    RequireConsent = false,
                    RedirectUris = { "http://localhost:44350" },
                    PostLogoutRedirectUris = { "http://localhost:44350/unauthorized" },
                    AllowedCorsOrigins = { "http://localhost:44350" },
                    AllowedScopes =
                    {
                        StandardScopes.OpenId.Name,
                        StandardScopes.Profile.Name,
                        StandardScopes.Email.Name,
                        "OfficeBook.WebApi"
                    }

                }


            };
        }
    }
}
