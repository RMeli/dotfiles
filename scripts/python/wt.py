import argparse as ap
import re
import sys

parser = ap.ArgumentParser(description="Work Time (WT)")
parser.add_argument(
    "worktime",
    type=str,
    help="Work time intervals, e.g. '08:00-12:00 + 13:00-17:30 ='",
)
args = parser.parse_args()

# Assume work time of the following format:
# AA:BB-CC:DD + EE:FF-GG:HH = [II:JJ]

TIME_RE = re.compile(r"^(\d{1,2}):(\d{2})$")
DURATION_RE = re.compile(r"^(\d+):(\d{2})$")


def error(msg: str) -> None:
    sys.exit(f"Invalid work time format: {msg}")


def parse_time(s: str, allow_24: bool = False) -> int:
    """Parse HH:MM into minutes since midnight."""
    m = TIME_RE.match(s.strip())
    if m is None:
        error(f"'{s.strip()}' is not a HH:MM time")
    hours, minutes = int(m.group(1)), int(m.group(2))
    if minutes >= 60 or hours > 24 or (hours == 24 and (minutes != 0 or not allow_24)):
        error(f"'{s.strip()}' is not a valid time")
    return hours * 60 + minutes


def parse_duration(s: str) -> int:
    """Parse H+:MM duration into minutes."""
    m = DURATION_RE.match(s.strip())
    if m is None or int(m.group(2)) >= 60:
        error(f"'{s.strip()}' is not a valid HH:MM duration")
    return int(m.group(1)) * 60 + int(m.group(2))


def format_duration(minutes: int) -> str:
    return f"{minutes // 60:02d}:{minutes % 60:02d}"


def total_minutes(intervals: str) -> int:
    total = 0
    for interval in intervals.split("+"):
        bounds = interval.split("-")
        if len(bounds) != 2:
            error(f"'{interval.strip()}' is not a HH:MM-HH:MM interval")

        start = parse_time(bounds[0])
        end = parse_time(bounds[1], allow_24=True)

        # Interval spanning midnight
        if end < start:
            end += 24 * 60

        total += end - start
    return total


buffer = args.worktime.split("=")
if len(buffer) > 2:
    error("more than one '='")

lhs = buffer[0].strip()
rhs = buffer[1].strip() if len(buffer) == 2 else ""

if not lhs and not rhs:
    error("empty input")

# WT already calculated manually
if rhs:
    manual = parse_duration(rhs)
    if lhs:
        computed = total_minutes(lhs)
        if computed != manual:
            print(
                f"Warning: manual total {format_duration(manual)} differs "
                f"from computed total {format_duration(computed)}",
                file=sys.stderr,
            )
    print(format_duration(manual))
    sys.exit(0)

print(format_duration(total_minutes(lhs)))
