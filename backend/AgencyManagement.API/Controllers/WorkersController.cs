using AgencyManagement.API.Data;
using AgencyManagement.API.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using AgencyManagement.API.DTOs;

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

        return worker;
    }

    // POST: api/workers
    [HttpPost]
    public async Task<ActionResult<Worker>> CreateWorker(Worker worker)
    {
        _context.Workers.Add(worker);
        await _context.SaveChangesAsync();

        return CreatedAtAction(
            nameof(GetWorker),
            new { id = worker.WorkerId },
            worker);
    }

    // PUT: api/workers/5
    [HttpPut("{id}")]
    public async Task<IActionResult> UpdateWorker(int id, Worker updatedWorker)
    {
        if (id != updatedWorker.WorkerId)
        {
            return BadRequest();
        }

        var worker = await _context.Workers.FindAsync(id);

        if (worker == null)
        {
            return NotFound();
        }

        worker.FirstName = updatedWorker.FirstName;
        worker.LastName = updatedWorker.LastName;
        worker.Email = updatedWorker.Email;
        worker.PhoneNumber = updatedWorker.PhoneNumber;
        worker.Status = updatedWorker.Status;
        worker.EmploymentEndDate = updatedWorker.EmploymentEndDate;
        worker.EmploymentEndReason = updatedWorker.EmploymentEndReason;

        await _context.SaveChangesAsync();

        return NoContent();
    }

// PUT: api/workers/5/status
[HttpPut("{id}/status")]
public async Task<IActionResult> UpdateWorkerStatus(
    int id,
    UpdateWorkerStatusDto dto)
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