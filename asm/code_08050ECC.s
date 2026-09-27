	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08050ECC
sub_08050ECC: @ 0x08050ECC
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r7, _08050EF0 @ =0x0203E00A
	movs r1, #0
	ldrsh r0, [r7, r1]
	cmp r0, #0
	beq _08050EE6
	bl CheckInEkrDragon
	adds r6, r0, #0
	cmp r6, #0
	beq _08050EF4
_08050EE6:
	adds r0, r5, #0
	bl Proc_Break
	b _08050F38
	.align 2, 0
_08050EF0: .4byte 0x0203E00A
_08050EF4:
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r0, #8
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	adds r4, r0, #0
	movs r1, #0
	ldrsh r0, [r7, r1]
	subs r0, #1
	bl PutBanimBgPAL
	ldr r0, _08050F40 @ =0x02022860
	movs r1, #6
	movs r2, #0xa
	adds r3, r4, #0
	bl EfxPalBlackInOut
	bl EnablePalSync
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bne _08050F38
	strh r6, [r5, #0x2c]
	adds r0, r5, #0
	bl Proc_Break
_08050F38:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08050F40: .4byte 0x02022860
