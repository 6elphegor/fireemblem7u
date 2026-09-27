	.include "macro.inc"

	.syntax unified

	thumb_func_start GenerateGasTrapTargets
GenerateGasTrapTargets: @ 0x0802BF04
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	adds r4, r1, #0
	mov r8, r2
	movs r0, #0
	mov sb, r0
	movs r7, #0
	cmp r3, #1
	beq _0802BF46
	cmp r3, #1
	bgt _0802BF26
	cmp r3, #0
	beq _0802BF40
	b _0802BF4A
_0802BF26:
	cmp r3, #2
	beq _0802BF38
	cmp r3, #3
	bne _0802BF4A
	movs r0, #0
	mov sb, r0
	movs r7, #1
	rsbs r7, r7, #0
	b _0802BF4A
_0802BF38:
	movs r0, #0
	mov sb, r0
	movs r7, #1
	b _0802BF4A
_0802BF40:
	movs r0, #1
	rsbs r0, r0, #0
	b _0802BF48
_0802BF46:
	movs r0, #1
_0802BF48:
	mov sb, r0
_0802BF4A:
	movs r6, #2
_0802BF4C:
	add r5, sb
	adds r4, r4, r7
	ldr r0, _0802BF80 @ =0x0202E3DC
	ldr r1, [r0]
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r0, r5
	ldrb r0, [r1]
	cmp r0, #0
	beq _0802BF6E
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	mov r3, r8
	bl EnlistTarget
_0802BF6E:
	subs r6, #1
	cmp r6, #0
	bge _0802BF4C
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802BF80: .4byte 0x0202E3DC
