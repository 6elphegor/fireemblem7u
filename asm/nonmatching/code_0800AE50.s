	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800AE50
sub_0800AE50: @ 0x0800AE50
	push {lr}
	bl RefreshBMapGraphics
	bl UnlockBmDisplay
	bl ReleaseMus
	ldr r0, _0800AE84 @ =0x02022C60
	movs r1, #0
	bl TmFill
	ldr r0, _0800AE88 @ =0x02023460
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl EnableBgSync
	movs r0, #2
	bl EnableBgSync
	bl ClearTalk
	pop {r0}
	bx r0
	.align 2, 0
_0800AE84: .4byte 0x02022C60
_0800AE88: .4byte 0x02023460
