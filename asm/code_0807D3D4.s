	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807D3D4
sub_0807D3D4: @ 0x0807D3D4
	push {lr}
	movs r0, #0x25
	bl GetUnitFromCharId
	ldrb r1, [r0, #0x11]
	ldrb r0, [r0, #0x10]
	subs r0, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bhi _0807D3F2
	cmp r1, #2
	bhi _0807D3F2
	movs r0, #1
	b _0807D3F4
_0807D3F2:
	movs r0, #0
_0807D3F4:
	pop {r1}
	bx r1
