using JuanYunis.ViewModels.BasketVMs;
using Microsoft.AspNetCore.Mvc;

namespace JuanYunis.Interfaces
{
    public interface ILayoutService
    {
        Task<int> GetBasketCountsync();
        Task<Dictionary<string, string>> GetSettingsAsync();
        Task<List<BasketVM>> GetBasketsAsync();
    }
}
