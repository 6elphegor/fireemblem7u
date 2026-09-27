	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08014824
sub_08014824: @ 0x08014824
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	str r0, [sp]
	adds r7, r1, #0
	mov sl, r2
	ldr r0, [sp, #0x28]
	mov ip, r0
	ldr r0, [sp, #0x34]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov sb, r3
	ldr r1, [sp, #0x30]
	str r1, [sp, #4]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080148A4
	movs r5, #0
	ldr r2, [sp, #0x2c]
	cmp r5, r2
	bge _080148EC
_08014854:
	movs r2, #0
	adds r6, r5, #1
	cmp r2, ip
	bge _0801489A
	lsls r3, r5, #6
	movs r0, #0x80
	lsls r0, r0, #3
	mov r8, r0
_08014864:
	adds r0, r7, r2
	adds r4, r2, #1
	cmp r0, #0x1f
	bhi _08014894
	mov r2, sl
	adds r1, r2, r5
	cmp r1, #0x1f
	bhi _08014894
	lsls r1, r1, #6
	lsls r0, r0, #1
	ldr r2, [sp]
	adds r0, r0, r2
	adds r1, r1, r0
	mov r2, ip
	subs r0, r2, r4
	lsls r0, r0, #1
	ldr r2, [sp, #4]
	adds r0, r0, r2
	adds r0, r3, r0
	ldrh r0, [r0]
	add r0, sb
	mov r2, r8
	eors r0, r2
	strh r0, [r1]
_08014894:
	adds r2, r4, #0
	cmp r2, ip
	blt _08014864
_0801489A:
	adds r5, r6, #0
	ldr r0, [sp, #0x2c]
	cmp r5, r0
	blt _08014854
	b _080148EC
_080148A4:
	movs r5, #0
	ldr r1, [sp, #0x2c]
	cmp r5, r1
	bge _080148EC
	lsls r2, r7, #1
	mov r8, r2
_080148B0:
	movs r2, #0
	adds r6, r5, #1
	cmp r2, ip
	bge _080148E4
	lsls r0, r5, #6
	ldr r1, [sp, #4]
	adds r4, r1, r0
	ldr r3, [sp]
	add r3, r8
_080148C2:
	adds r0, r7, r2
	cmp r0, #0x1f
	bhi _080148DA
	mov r1, sl
	adds r0, r1, r5
	cmp r0, #0x1f
	bhi _080148DA
	lsls r0, r0, #6
	adds r0, r0, r3
	ldrh r1, [r4]
	add r1, sb
	strh r1, [r0]
_080148DA:
	adds r4, #2
	adds r3, #2
	adds r2, #1
	cmp r2, ip
	blt _080148C2
_080148E4:
	adds r5, r6, #0
	ldr r2, [sp, #0x2c]
	cmp r5, r2
	blt _080148B0
_080148EC:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
