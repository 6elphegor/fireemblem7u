	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08043C0C
sub_08043C0C: @ 0x08043C0C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r6, r0, #0
	movs r7, #0
	movs r0, #0x38
	adds r0, r0, r6
	mov r8, r0
	movs r2, #0x3e
	adds r2, r2, r6
	mov sb, r2
_08043C26:
	lsls r0, r7, #1
	adds r5, r6, #0
	adds r5, #0x38
	adds r5, r5, r0
	movs r2, #0
	ldrsh r1, [r5, r2]
	adds r4, r6, #0
	adds r4, #0x3e
	adds r4, r4, r0
	movs r0, #0
	ldrsh r2, [r4, r0]
	lsls r3, r7, #2
	adds r0, r6, #0
	adds r0, #0x2c
	adds r0, r0, r3
	ldr r0, [r0]
	movs r3, #0xf
	ands r0, r3
	lsls r0, r0, #0xc
	str r0, [sp]
	movs r0, #4
	ldr r3, _08043CBC @ =0x08B99968
	bl PutSprite
	movs r2, #0
	ldrsh r1, [r5, r2]
	adds r1, #0x28
	movs r0, #0
	ldrsh r2, [r4, r0]
	adds r2, #8
	lsls r0, r7, #6
	str r0, [sp]
	movs r0, #4
	ldr r3, _08043CC0 @ =0x08B9993C
	bl PutSprite
	adds r7, #1
	cmp r7, #2
	ble _08043C26
	ldr r1, _08043CC4 @ =0x02000C04
	ldr r0, [r6, #0x44]
	lsls r0, r0, #2
	adds r1, #0xc
	adds r0, r0, r1
	ldr r0, [r0]
	bl sub_08043B1C
	ldr r1, [r6, #0x44]
	lsls r1, r1, #1
	mov r2, r8
	adds r0, r2, r1
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r0, #0x10
	add r1, sb
	movs r2, #0
	ldrsh r1, [r1, r2]
	adds r1, #8
	bl PutUiHand
	ldr r0, [r6, #0x50]
	cmp r0, #1
	bne _08043CAE
	movs r0, #0
	str r0, [r6, #0x54]
	adds r0, r6, #0
	bl Proc_Break
_08043CAE:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08043CBC: .4byte 0x08B99968
_08043CC0: .4byte 0x08B9993C
_08043CC4: .4byte 0x02000C04
