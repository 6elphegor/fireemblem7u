	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0802201C
sub_0802201C: @ 0x0802201C
	push {lr}
	adds r3, r0, #0
	ldr r0, _08022048 @ =0x03004690
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r2, [r0, #4]
	ldr r0, [r1, #0x28]
	ldr r1, [r2, #0x28]
	orrs r0, r1
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08022050
	ldr r1, _0802204C @ =0x0202BBB8
	movs r0, #0x9e
	strh r0, [r1, #0x2c]
	adds r0, r3, #0
	bl sub_08021FB4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _08022052
	.align 2, 0
_08022048: .4byte 0x03004690
_0802204C: .4byte 0x0202BBB8
_08022050:
	movs r0, #3
_08022052:
	pop {r1}
	bx r1
	.align 2, 0
