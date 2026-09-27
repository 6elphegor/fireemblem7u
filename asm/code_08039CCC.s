	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08039CCC
sub_08039CCC: @ 0x08039CCC
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemIndex
	cmp r0, #0x4a
	blt _08039CFC
	cmp r0, #0x4e
	ble _08039CE4
	cmp r0, #0x56
	beq _08039CF0
	b _08039CFC
_08039CE4:
	ldr r0, _08039CEC @ =0x03004690
	ldr r1, [r0]
	movs r0, #4
	b _08039CF6
	.align 2, 0
_08039CEC: .4byte 0x03004690
_08039CF0:
	ldr r0, _08039D00 @ =0x03004690
	ldr r1, [r0]
	movs r0, #0x10
_08039CF6:
	ldrb r2, [r1, #0xa]
	orrs r0, r2
	strb r0, [r1, #0xa]
_08039CFC:
	pop {r0}
	bx r0
	.align 2, 0
_08039D00: .4byte 0x03004690
