	.include "macro.inc"

	.syntax unified

	thumb_func_start StartTalkWaitForInput
StartTalkWaitForInput: @ 0x080092BC
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	ldr r0, _080092E4 @ =0x08B90A4C
	adds r1, r3, #0
	bl Proc_StartBlocking
	adds r2, r0, #0
	adds r0, #0x64
	movs r1, #0
	strh r4, [r0]
	adds r0, #2
	strh r5, [r0]
	adds r0, #2
	strh r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080092E4: .4byte 0x08B90A4C
