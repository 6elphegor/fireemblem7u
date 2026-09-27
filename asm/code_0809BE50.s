	.include "macro.inc"

	.syntax unified

	thumb_func_start StartSupportScreenFromPrepScreen
StartSupportScreenFromPrepScreen: @ 0x0809BE50
	push {lr}
	adds r1, r0, #0
	ldr r0, _0809BE64 @ =0x08CC57F4
	bl Proc_StartBlocking
	adds r0, #0x42
	movs r1, #1
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_0809BE64: .4byte 0x08CC57F4
