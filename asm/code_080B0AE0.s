	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B0AE0
sub_080B0AE0: @ 0x080B0AE0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x5b
	ldrb r0, [r1]
	cmp r0, #4
	bls _080B0B1C
	bl HasConvoyAccess
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	beq _080B0B0A
	movs r0, #0x2d
	ldr r1, [r7]
	bl sub_080B034C
	b _080B0B1A
_080B0B0A:
	movs r0, #0x30
	ldr r1, [r7]
	bl sub_080B034C
	ldr r0, [r7]
	movs r1, #0xb
	bl Proc_Goto
_080B0B1A:
	b _080B0B46
_080B0B1C:
	ldr r1, [r7]
	ldr r0, [r1, #0x2c]
	ldr r1, [r7]
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x5c
	ldrb r2, [r3]
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r1, #0x30
	adds r2, r1, r2
	ldrh r1, [r2]
	bl UnitAddItem
	ldr r0, [r7]
	bl sub_080B2020
	ldr r0, [r7]
	movs r1, #3
	bl Proc_Goto
_080B0B46:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
