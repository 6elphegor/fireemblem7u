	.include "macro.inc"

	.syntax unified

	thumb_func_start LoadLinkArenaRuleSettings
LoadLinkArenaRuleSettings: @ 0x08041FD4
	ldr r1, _08041FF4 @ =0x0203D90C
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r1, r2
	ldrb r2, [r1]
	lsls r1, r2, #0x1f
	lsrs r1, r1, #0x1f
	strb r1, [r0]
	lsls r1, r2, #0x1e
	lsrs r1, r1, #0x1f
	strb r1, [r0, #1]
	lsls r2, r2, #0x1d
	lsrs r2, r2, #0x1f
	strb r2, [r0, #2]
	bx lr
	.align 2, 0
_08041FF4: .4byte 0x0203D90C
