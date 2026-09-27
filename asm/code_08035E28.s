	.include "macro.inc"

	.syntax unified

	thumb_func_start AiIsInByteList
AiIsInByteList: @ 0x08035E28
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	b _08035E38
_08035E2E:
	cmp r2, r1
	bne _08035E36
	movs r0, #1
	b _08035E40
_08035E36:
	adds r0, #1
_08035E38:
	ldrb r2, [r0]
	cmp r2, #0
	bne _08035E2E
	movs r0, #0
_08035E40:
	bx lr
	.align 2, 0
