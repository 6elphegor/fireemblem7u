	.include "macro.inc"

	.syntax unified

	thumb_func_start PrintStringToTexts
PrintStringToTexts: @ 0x0800A00C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sl, r0
	adds r4, r1, #0
	str r2, [sp]
	mov sb, r3
	movs r6, #0
	mov r7, sl
	adds r5, r2, #0
	b _0800A032
_0800A028:
	ldr r0, [r7]
	adds r1, r4, #0
	bl Text_DrawCharacter
	adds r4, r0, #0
_0800A032:
	movs r0, #0
	mov r8, r0
	ldrb r0, [r4]
	cmp r0, #0
	beq _0800A058
	cmp r0, #1
	bne _0800A052
	ldm r7!, {r0}
	adds r1, r5, #0
	bl PutText
	adds r5, #0x80
	adds r6, #1
	adds r4, #1
	cmp r6, sb
	bge _0800A068
_0800A052:
	mov r2, r8
	cmp r2, #0
	beq _0800A028
_0800A058:
	lsls r0, r6, #2
	add r0, sl
	ldr r0, [r0]
	lsls r1, r6, #7
	ldr r2, [sp]
	adds r1, r2, r1
	bl PutText
_0800A068:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
