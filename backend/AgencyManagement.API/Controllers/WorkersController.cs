using AgencyManagement.API.Data;
using AgencyManagement.API.DTOs;
using AgencyManagement.API.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace AgencyManagement.API.Controllers;

[ApiController]
[Route("api/[controller]")]
public class WorkersController : ControllerBase
{
    private readonly ApplicationDbContext _context;

    public WorkersController(ApplicationDbContext context)
    {
        _context = context;
    }

    // GET: api/workers
    [HttpGet]
    public async Task<ActionResult<IEnumerable<Worker>>> GetWorkers()
    {
        return await _context.Workers.ToListAsync();
    }

    // GET: api/workers/5
    [HttpGet("{id}")]
    public async Task<ActionResult<Worker>> GetWorker(int id)
    {
        var worker = await _context.Workers.FindAsync(id);

        if (worker == null)
        {
            return NotFound();
        }

        return new WorkerDto
{
    WorkerId = worker.WorkerId,
    FirstName = worker.FirstName,
    LastName = worker.LastName,
    Email = worker.Email,
    PhoneNumber = worker.PhoneNumber,
    Status = worker.Status
};
    }

    // POST: api/workers
    [HttpPost]
    public async Task<ActionResult<Worker>> CreateWorker(CreateWorkerDto dto)
    {
        var worker = new Worker
        {
            FirstName = dto.FirstName,
            LastName = dto.LastName,
            Email = dto.Email,
            PhoneNumber = dto.PhoneNumber,
            Status = dto.Status
        };

        _context.Workers.Add(worker);
        await _context.SaveChangesAsync();

        return CreatedAtAction(
            nameof(GetWorker),
            new { id = worker.WorkerId },
            worker);
    }

    // PUT: api/workers/5
[HttpPut("{id}")]
public async Task<IActionResult> UpdateWorker(int id, UpdateWorkerDto dto)
{
    var worker = await _context.Workers.FindAsync(id);

    if (worker == null)
    {
        return NotFound();
    }

    worker.FirstName = dto.FirstName;
    worker.LastName = dto.LastName;
    worker.Email = dto.Email;
    worker.PhoneNumber = dto.PhoneNumber;
    worker.Status = dto.Status;

    await _context.SaveChangesAsync();

    return NoContent();
}

    // PUT: api/workers/5/status
    [HttpPut("{id}/status")]
    public async Task<IActionResult> UpdateWorkerStatus(int id, UpdateWorkerStatusDto dto)
    {
        var worker = await _context.Workers.FindAsync(id);

        if (worker == null)
        {
            return NotFound();
        }

        worker.Status = dto.Status;
        worker.EmploymentEndDate = dto.EmploymentEndDate;
        worker.EmploymentEndReason = dto.EmploymentEndReason;

        await _context.SaveChangesAsync();

        return NoContent();
    }
}