	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08022058
sub_08022058: @ 0x08022058
	push {lr}
	adds r3, r0, #0
	ldr r0, _08022084 @ =0x03004690
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r2, [r0, #4]
	ldr r0, [r1, #0x28]
	ldr r1, [r2, #0x28]
	orrs r0, r1
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0802208C
	ldr r1, _08022088 @ =0x0202BBB8
	movs r0, #0x9d
	strh r0, [r1, #0x2c]
	adds r0, r3, #0
	bl sub_08021FB4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _0802208E
	.align 2, 0
_08022084: .4byte 0x03004690
_08022088: .4byte 0x0202BBB8
_0802208C:
	movs r0, #3
_0802208E:
	pop {r1}
	bx r1
	.align 2, 0
