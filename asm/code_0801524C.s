	.include "macro.inc"

	.syntax unified

	thumb_func_start OnVBlank
OnVBlank: @ 0x0801524C
	push {lr}
	ldr r1, _08015290 @ =0x03007FF8
	movs r0, #1
	strh r0, [r1]
	bl IncGameTime
	bl m4aSoundVSync
	ldr r0, _08015294 @ =0x02026A30
	ldr r0, [r0]
	bl Proc_Run
	bl SyncLoOam
	ldr r1, _08015298 @ =0x0202BBB8
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _08015286
	movs r0, #0
	strb r0, [r1]
	bl SyncDispIo
	bl SyncBgsAndPal
	bl ApplyDataMoves
	bl SyncHiOam
_08015286:
	bl m4aSoundMain
	pop {r0}
	bx r0
	.align 2, 0
_08015290: .4byte 0x03007FF8
_08015294: .4byte 0x02026A30
_08015298: .4byte 0x0202BBB8
