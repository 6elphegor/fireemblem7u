	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08096604
sub_08096604: @ 0x08096604
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	adds r1, r4, #0
	bl sub_08095C28
	movs r0, #0
	bl DisableUiCursorHand
	adds r0, r4, #0
	bl sub_08095FCC
	adds r0, r4, #0
	adds r0, #0x33
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, #0x24
	movs r3, #0x80
	lsls r3, r3, #3
	movs r0, #0x44
	movs r2, #4
	bl ShowSysHandCursor
	ldr r0, _0809665C @ =PutGiveSprites
	bl GetParallelWorker
	bl Proc_End
	ldr r0, _08096660 @ =PutTakeSprites
	bl GetParallelWorker
	bl Proc_End
	ldr r0, _08096664 @ =PutGiveTakeBoxSprites
	adds r1, r4, #0
	bl StartParallelWorker
	movs r0, #7
	bl EnableBgSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809665C: .4byte PutGiveSprites
_08096660: .4byte PutTakeSprites
_08096664: .4byte PutGiveTakeBoxSprites
