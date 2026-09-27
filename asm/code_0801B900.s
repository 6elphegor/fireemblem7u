	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0801B900
sub_0801B900: @ 0x0801B900
	push {r4, lr}
	ldr r4, _0801B920 @ =0x02022D2E
	movs r0, #0
	bl GetChapterInfo
	ldr r1, [r0]
	adds r0, r4, #0
	bl DebugPutStr
	movs r0, #1
	bl EnableBgSync
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0801B920: .4byte 0x02022D2E
