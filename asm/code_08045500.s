	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08045500
sub_08045500: @ 0x08045500
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, _08045534 @ =0x0203DC9C
	ldr r1, _08045538 @ =0x0203D90C
	adds r1, #0xa0
	ldrb r3, [r1]
	lsls r0, r3, #1
	adds r0, r0, r3
	ldrb r2, [r2, #9]
	cmp r2, r0
	blt _08045528
	bl EndLinkArenaPointsBox
	ldr r0, _0804553C @ =0x08B99D3C
	bl StartEvent
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
_08045528:
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08045534: .4byte 0x0203DC9C
_08045538: .4byte 0x0203D90C
_0804553C: .4byte 0x08B99D3C
