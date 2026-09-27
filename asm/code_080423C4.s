	.include "macro.inc"

	.syntax unified

	thumb_func_start SioMenu_GetItemHelpText
SioMenu_GetItemHelpText: @ 0x080423C4
	push {r4, r5, r6, lr}
	sub sp, #0x28
	adds r2, r0, #0
	adds r3, r1, #0
	mov r0, sp
	ldr r1, _080423F8 @ =0x081D53F4
	ldm r1!, {r4, r5, r6}
	stm r0!, {r4, r5, r6}
	ldm r1!, {r4, r5, r6}
	stm r0!, {r4, r5, r6}
	ldm r1!, {r4, r5, r6}
	stm r0!, {r4, r5, r6}
	ldr r1, [r1]
	str r1, [r0]
	cmp r3, #0
	bne _08042400
	adds r0, r2, #0
	adds r0, #0x58
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08042414
	ldr r0, _080423FC @ =0x000003B3
	b _08042420
	.align 2, 0
_080423F8: .4byte 0x081D53F4
_080423FC: .4byte 0x000003B3
_08042400:
	adds r0, r2, #0
	adds r0, #0x58
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08042414
	movs r0, #1
	rsbs r0, r0, #0
	b _08042420
_08042414:
	ldr r0, [r2, #0x48]
	lsls r0, r0, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
_08042420:
	add sp, #0x28
	pop {r4, r5, r6}
	pop {r1}
	bx r1
