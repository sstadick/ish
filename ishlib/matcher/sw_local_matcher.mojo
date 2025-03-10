"""Smith-Waterman local alignment."""
from ishlib.matcher import Matcher, MatchResult
from ishlib.matcher.alignment.local_align import smith_waterman


@value
struct SWLocalMatcher(Matcher):
    fn first_match(
        mut self, haystack: Span[UInt8], pattern: Span[UInt8]
    ) -> Optional[MatchResult]:
        """Find the first match in the haystack."""
        var result = smith_waterman(
            haystack, pattern, match_score=2, mismatch_score=-2, gap_penalty=-3
        )
        if result.score == len(pattern):
            return MatchResult(
                result.coords.value()[0], result.coords.value()[1]
            )

        return None
