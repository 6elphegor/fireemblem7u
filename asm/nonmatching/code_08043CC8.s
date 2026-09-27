	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08043CC8
sub_08043CC8: @ 0x08043CC8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r5, r0, #0
	movs r0, #0
	mov r8, r0
	movs r7, #0
_08043CD8:
	ldr r0, [r5, #0x44]
	cmp r8, r0
	beq _08043D06
	adds r0, r5, #0
	adds r0, #0x38
	adds r0, r0, r7
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r3, [r5, #0x54]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #5
	movs r2, #0xa0
	lsls r2, r2, #1
	bl Interpolate
	adds r6, r0, #0
	adds r0, r5, #0
	adds r0, #0x3e
	adds r0, r0, r7
	movs r3, #0
	ldrsh r4, [r0, r3]
	b _08043D2C
_08043D06:
	adds r0, r5, #0
	adds r0, #0x38
	adds r0, r0, r7
	movs r1, #0
	ldrsh r6, [r0, r1]
	adds r0, r5, #0
	adds r0, #0x3e
	adds r0, r0, r7
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r3, #0x3e
	ldrsh r2, [r5, r3]
	ldr r3, [r5, #0x54]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #4
	bl Interpolate
	adds r4, r0, #0
_08043D2C:
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
	ldr r3, _08043D9C @ =0x08B99968
	bl PutSprite
	adds r1, r6, #0
	adds r1, #0x28
	adds r2, r4, #0
	adds r2, #8
	mov r3, r8
	lsls r0, r3, #6
	str r0, [sp]
	movs r0, #4
	ldr r3, _08043DA0 @ =0x08B9993C
	bl PutSprite
	adds r7, #2
	movs r0, #1
	add r8, r0
	mov r1, r8
	cmp r1, #2
	ble _08043CD8
	ldr r1, _08043DA4 @ =0x02000C04
	ldr r0, [r5, #0x44]
	lsls r0, r0, #2
	adds r1, #0xc
	adds r0, r0, r1
	ldr r0, [r0]
	bl sub_08043B1C
	ldr r0, [r5, #0x50]
	cmp r0, #2
	bne _08043D8E
	movs r0, #0
	str r0, [r5, #0x54]
	adds r0, r5, #0
	bl Proc_Break
_08043D8E:
	ldr r0, [r5, #0x54]
	cmp r0, #0xf
	bgt _08043DA8
	adds r0, #1
	str r0, [r5, #0x54]
	b _08043DAC
	.align 2, 0
_08043D9C: .4byte 0x08B99968
_08043DA0: .4byte 0x08B9993C
_08043DA4: .4byte 0x02000C04
_08043DA8:
	movs r0, #0
	str r0, [r5, #0x50]
_08043DAC:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
