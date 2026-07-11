using AgencyManagement.API.Data;
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
}