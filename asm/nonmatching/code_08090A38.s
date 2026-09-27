	.include "macro.inc"

	.syntax unified

	thumb_func_start StartSallyCirProc
StartSallyCirProc: @ 0x08090A38
	push {r4, lr}
	adds r2, r0, #0
	lsls r4, r1, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _08090A54 @ =0x08CC438C
	adds r1, r2, #0
	bl Proc_StartBlocking
	adds r1, r0, #0
	adds r1, #0x2a
	strb r4, [r1]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08090A54: .4byte 0x08CC438C
