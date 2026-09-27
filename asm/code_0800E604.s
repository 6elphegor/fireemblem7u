	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_SetMapId
EvtCmd_SetMapId: @ 0x0800E604
	ldr r1, _0800E610 @ =0x0202BBF8
	ldr r0, [r0, #0x30]
	ldrh r0, [r0, #2]
	strb r0, [r1, #0xe]
	movs r0, #0
	bx lr
	.align 2, 0
_0800E610: .4byte 0x0202BBF8
