using Microsoft.EntityFrameworkCore;
using AgencyManagement.API.Data;
using AgencyManagement.API.DTOs;

namespace AgencyManagement.API.Services;

public class WorkerService : IWorkerService
{
    private readonly ApplicationDbContext _context;

    public WorkerService(ApplicationDbContext context)
    {
        _context = context;
    }

    public async Task<IEnumerable<WorkerDto>> GetAllAsync()
{
    return await _context.Workers
        .Select(w => new WorkerDto
        {
            WorkerId = w.WorkerId,
            FirstName = w.FirstName,
            LastName = w.LastName,
            Email = w.Email,
            PhoneNumber = w.PhoneNumber,
            Status = w.Status
        })
        .ToListAsync();
}

    public Task<WorkerDto?> GetByIdAsync(int id)
    {
        throw new NotImplementedException();
    }

    public Task<WorkerDto> CreateAsync(CreateWorkerDto dto)
    {
        throw new NotImplementedException();
    }

    public Task<bool> UpdateAsync(int id, UpdateWorkerDto dto)
    {
        throw new NotImplementedException();
    }

    public Task<bool> UpdateStatusAsync(int id, UpdateWorkerStatusDto dto)
    {
        throw new NotImplementedException();
    }
}