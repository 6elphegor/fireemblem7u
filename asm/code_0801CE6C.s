	.include "macro.inc"

	.syntax unified

	thumb_func_start GetPlayerSelectKind
GetPlayerSelectKind: @ 0x0801CE6C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0801CE98 @ =0x0202BBF8
	ldrb r2, [r0, #0xf]
	cmp r4, #0
	beq _0801CEA6
	ldr r1, _0801CE9C @ =0x0202BBB8
	movs r0, #0x10
	ldrb r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	beq _0801CEA2
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl CanCharacterBePrepMoved
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801CEA0
	movs r0, #4
	b _0801CEEE
	.align 2, 0
_0801CE98: .4byte 0x0202BBF8
_0801CE9C: .4byte 0x0202BBB8
_0801CEA0:
	movs r2, #0
_0801CEA2:
	cmp r4, #0
	bne _0801CEAA
_0801CEA6:
	movs r0, #0
	b _0801CEEE
_0801CEAA:
	movs r0, #0xc0
	ldrb r1, [r4, #0xb]
	ands r0, r1
	cmp r0, r2
	bne _0801CEEC
	ldr r0, [r4, #0xc]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _0801CED2
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #0xd
	ands r0, r1
	cmp r0, #0
	beq _0801CED6
_0801CED2:
	movs r0, #1
	b _0801CEEE
_0801CED6:
	adds r0, r4, #0
	adds r0, #0x30
	movs r1, #0xf
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #2
	beq _0801CEEC
	cmp r1, #4
	beq _0801CEEC
	movs r0, #2
	b _0801CEEE
_0801CEEC:
	movs r0, #3
_0801CEEE:
	pop {r4}
	pop {r1}
	bx r1
