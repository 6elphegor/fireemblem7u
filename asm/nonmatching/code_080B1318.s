	.include "macro.inc"

	.syntax unified

	thumb_func_start StartShopFadeOut
StartShopFadeOut: @ 0x080B1318
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _080B1340 @ =0x0202BBB8
	ldrb r1, [r0, #4]
	movs r2, #0x10
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _080B1348
	ldr r1, _080B1344 @ =0x08CE6F80
	adds r0, r1, #0
	ldr r1, [r7]
	bl Proc_StartBlocking
	b _080B134C
	.align 2, 0
_080B1340: .4byte 0x0202BBB8
_080B1344: .4byte 0x08CE6F80
_080B1348:
	bl ClearTalk
_080B134C:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
