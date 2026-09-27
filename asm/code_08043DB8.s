	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08043DB8
sub_08043DB8: @ 0x08043DB8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r5, r0, #0
	movs r0, #0
	mov r8, r0
	movs r7, #0
_08043DC8:
	ldr r0, [r5, #0x44]
	cmp r8, r0
	beq _08043DF4
	adds r0, r5, #0
	adds r0, #0x38
	adds r0, r0, r7
	movs r1, #0
	ldrsh r2, [r0, r1]
	ldr r3, [r5, #0x54]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #5
	movs r1, #0xf0
	bl Interpolate
	adds r6, r0, #0
	adds r0, r5, #0
	adds r0, #0x3e
	adds r0, r0, r7
	movs r3, #0
	ldrsh r4, [r0, r3]
	b _08043E1A
_08043DF4:
	adds r0, r5, #0
	adds r0, #0x38
	adds r0, r0, r7
	movs r1, #0
	ldrsh r6, [r0, r1]
	movs r3, #0x3e
	ldrsh r1, [r5, r3]
	adds r0, r5, #0
	adds r0, #0x3e
	adds r0, r0, r7
	movs r3, #0
	ldrsh r2, [r0, r3]
	ldr r3, [r5, #0x54]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #4
	bl Interpolate
	adds r4, r0, #0
_08043E1A:
	mov r0, r8
	lsls r1, r0, #2
	adds r0, r5, #0
	adds r0, #0x2c
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #0xf
	ands r0, r1
	lsls r0, r0, #0xc
	str r0, [sp]
	movs r0, #4
	adds r1, r6, #0
	adds r2, r4, #0
	ldr r3, _08043E78 @ =0x08B99968
	bl PutSprite
	adds r1, r6, #0
	adds r1, #0x28
	adds r2, r4, #0
	adds r2, #8
	mov r3, r8
	lsls r0, r3, #6
	str r0, [sp]
	movs r0, #4
	ldr r3, _08043E7C @ =0x08B9993C
	bl PutSprite
	adds r7, #2
	movs r0, #1
	add r8, r0
	mov r1, r8
	cmp r1, #2
	ble _08043DC8
	ldr r0, _08043E80 @ =0x02000C04
	ldr r1, [r5, #0x44]
	lsls r1, r1, #2
	adds r0, #0xc
	adds r1, r1, r0
	ldr r0, [r1]
	bl sub_08043B1C
	ldr r0, [r5, #0x54]
	cmp r0, #0xf
	bgt _08043E84
	adds r0, #1
	str r0, [r5, #0x54]
	b _08043E92
	.align 2, 0
_08043E78: .4byte 0x08B99968
_08043E7C: .4byte 0x08B9993C
_08043E80: .4byte 0x02000C04
_08043E84:
	movs r0, #0
	str r0, [r5, #0x54]
	str r0, [r5, #0x50]
	adds r0, r5, #0
	movs r1, #0
	bl Proc_Goto
_08043E92:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
