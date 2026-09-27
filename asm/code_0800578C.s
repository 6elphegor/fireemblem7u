	.include "macro.inc"

	.syntax unified

	thumb_func_start Text_DrawNumber
Text_DrawNumber: @ 0x0800578C
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r4, r1, #0
	cmp r4, #0
	bne _080057A4
	ldr r1, _080057A0 @ =0x08193DA0
	bl Text_DrawCharacter
	b _080057CE
	.align 2, 0
_080057A0: .4byte 0x08193DA0
_080057A4:
	adds r0, r4, #0
	movs r1, #0xa
	bl __modsi3
	adds r0, #0x30
	mov r1, sp
	strh r0, [r1]
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	adds r4, r0, #0
	adds r0, r5, #0
	mov r1, sp
	bl Text_DrawCharacter
	ldrb r0, [r5, #2]
	subs r0, #0xf
	strb r0, [r5, #2]
	cmp r4, #0
	bne _080057A4
_080057CE:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
