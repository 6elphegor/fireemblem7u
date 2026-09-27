	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08018CC0
sub_08018CC0: @ 0x08018CC0
	push {lr}
	adds r2, r0, #0
	ldrb r0, [r2, #0x1b]
	cmp r0, #0
	beq _08018CE0
	ldr r1, _08018CDC @ =0x08B92EB0
	ldrb r2, [r2, #0x1b]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0]
	ldrh r0, [r0]
	b _08018CE4
	.align 2, 0
_08018CDC: .4byte 0x08B92EB0
_08018CE0:
	ldr r0, _08018CEC @ =0x08B92E88
	ldr r0, [r0]
_08018CE4:
	bl DecodeMsg
	pop {r1}
	bx r1
	.align 2, 0
_08018CEC: .4byte 0x08B92E88
