	.include "macro.inc"

	.syntax unified

	thumb_func_start StartTalkWaitForInputUnk
StartTalkWaitForInputUnk: @ 0x080092E8
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r0, _08009318 @ =0x08B90A4C
	adds r1, r4, #0
	bl Proc_StartBlocking
	adds r1, r0, #0
	adds r0, #0x64
	strh r5, [r0]
	adds r0, #2
	strh r6, [r0]
	adds r0, #2
	mov r1, r8
	strh r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08009318: .4byte 0x08B90A4C
