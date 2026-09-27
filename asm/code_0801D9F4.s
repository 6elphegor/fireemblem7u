	.include "macro.inc"

	.syntax unified

	thumb_func_start MenuCommand_SendItemToConvoy
MenuCommand_SendItemToConvoy: @ 0x0801D9F4
	push {r4, lr}
	ldr r4, _0801DA0C @ =0x0202BBB8
	ldrh r0, [r4, #0x2c]
	bl AddItemToConvoy
	ldr r1, _0801DA10 @ =0x0203A85C
	ldrh r0, [r4, #0x2c]
	strh r0, [r1, #6]
	movs r0, #0x37
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0801DA0C: .4byte 0x0202BBB8
_0801DA10: .4byte 0x0203A85C
