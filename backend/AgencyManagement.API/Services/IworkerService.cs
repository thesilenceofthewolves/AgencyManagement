using AgencyManagement.API.DTOs;

namespace AgencyManagement.API.Services;

public interface IWorkerService
{
    Task<IEnumerable<WorkerDto>> GetAllAsync();

    Task<WorkerDto?> GetByIdAsync(int id);

    Task<WorkerDto> CreateAsync(CreateWorkerDto dto);

    Task<bool> UpdateAsync(int id, UpdateWorkerDto dto);

    Task<bool> UpdateStatusAsync(int id, UpdateWorkerStatusDto dto);
}