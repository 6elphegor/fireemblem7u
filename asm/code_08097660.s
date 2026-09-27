	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08097660
sub_08097660: @ 0x08097660
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r7, r6, #0
	adds r7, #0x33
	ldrb r0, [r7]
	lsls r4, r0, #1
	adds r4, r4, r0
	lsls r4, r4, #2
	adds r4, #0x7c
	bl GetGameTime
	ldr r2, _080976D8 @ =0x02022860
	lsrs r0, r0, #2
	movs r1, #0xf
	ands r0, r1
	lsls r0, r0, #1
	ldr r1, _080976DC @ =0x08407400
	adds r0, r0, r1
	ldrh r0, [r0]
	ldr r1, _080976E0 @ =0x0000029A
	adds r2, r2, r1
	strh r0, [r2]
	bl EnablePalSync
	ldr r1, _080976E4 @ =0x08CC4FA0
	ldrb r2, [r7]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r3, [r0]
	movs r5, #0x85
	lsls r5, r5, #7
	str r5, [sp]
	movs r0, #4
	adds r1, r4, #0
	movs r2, #0x18
	bl PutSprite
	ldr r3, _080976E8 @ =0x08CC4F90
	str r5, [sp]
	movs r0, #4
	adds r1, r4, #0
	movs r2, #0x18
	bl PutSprite
	ldrb r7, [r7]
	lsls r0, r7, #1
	adds r6, #0x4a
	adds r6, r6, r0
	ldrh r1, [r6]
	ldr r0, _080976EC @ =0x02012466
	ldrh r2, [r0]
	movs r0, #0xb
	movs r3, #7
	bl UpdateMenuScrollBarConfig
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080976D8: .4byte 0x02022860
_080976DC: .4byte 0x08407400
_080976E0: .4byte 0x0000029A
_080976E4: .4byte 0x08CC4FA0
_080976E8: .4byte 0x08CC4F90
_080976EC: .4byte 0x02012466
