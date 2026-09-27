	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B4828
sub_080B4828: @ 0x080B4828
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _080B4884 @ =0x08CE76C8
	bl Proc_Find
	adds r5, r0, #0
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, #0x2c
	ldr r1, [r5, #0x34]
	adds r6, r1, r0
	cmp r5, #0
	beq _080B487C
	ldr r7, [r6, #4]
	cmp r7, #0
	beq _080B487C
	movs r4, #0
	str r4, [sp]
	ldr r1, _080B4888 @ =0x02022BA0
	ldr r2, _080B488C @ =0x01000008
	mov r0, sp
	bl CpuFastSet
	bl EnablePalSync
	ldr r0, [r7, #0x58]
	movs r1, #0xa
	bl SetMuPal
	movs r1, #1
	strb r1, [r6, #8]
	ldrb r0, [r6, #9]
	adds r2, r5, #0
	adds r2, #0x46
	strb r0, [r2]
	adds r0, r5, #0
	adds r0, #0x47
	strb r1, [r0]
	adds r0, #1
	strb r4, [r0]
_080B487C:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B4884: .4byte 0x08CE76C8
_080B4888: .4byte 0x02022BA0
_080B488C: .4byte 0x01000008
