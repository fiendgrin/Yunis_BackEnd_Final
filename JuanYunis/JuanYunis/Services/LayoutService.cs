using JuanYunis.DataAccessLayer;
using JuanYunis.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace JuanYunis.Services
{
    public class LayoutService : ILayoutService
    {
        private readonly AppDbContext _context;
        private readonly IHttpContextAccessor _contextAccessor;

        public LayoutService(IHttpContextAccessor contextAccessor, AppDbContext context)
        {
            _contextAccessor = contextAccessor;
            _context = context;
        }

        public async Task<Dictionary<string, string>> GetSettingsAsync()
        {
            Dictionary<string, string> settings = await _context.Settings.ToDictionaryAsync(s => s.Key, s => s.Value);
            return settings;
        }
    }
}
