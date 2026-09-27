	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08022ED0
sub_08022ED0: @ 0x08022ED0
	push {lr}
	ldr r0, _08022F00 @ =0x03004690
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08022EFA
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r1, _08022F04 @ =0x0202E3E0
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #8
	beq _08022F08
_08022EFA:
	movs r0, #3
	b _08022F1A
	.align 2, 0
_08022F00: .4byte 0x03004690
_08022F04: .4byte 0x0202E3E0
_08022F08:
	adds r0, r2, #0
	bl ArenaIsUnitAllowed
	lsls r0, r0, #0x18
	movs r1, #2
	cmp r0, #0
	beq _08022F18
	movs r1, #1
_08022F18:
	adds r0, r1, #0
_08022F1A:
	pop {r1}
	bx r1
	.align 2, 0
