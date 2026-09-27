	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080961D0
sub_080961D0: @ 0x080961D0
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r7, r6, #0
	adds r7, #0x35
	ldrb r0, [r7]
	lsls r4, r0, #1
	adds r4, r4, r0
	lsls r4, r4, #2
	adds r4, #0x7c
	bl GetGameTime
	ldr r2, _08096248 @ =0x02022860
	lsrs r0, r0, #2
	movs r1, #0xf
	ands r0, r1
	lsls r0, r0, #1
	ldr r1, _0809624C @ =0x08407400
	adds r0, r0, r1
	ldrh r0, [r0]
	ldr r1, _08096250 @ =0x000002DA
	adds r2, r2, r1
	strh r0, [r2]
	bl EnablePalSync
	ldr r1, _08096254 @ =0x08CC4FA0
	ldrb r2, [r7]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r3, [r0]
	movs r5, #0xc5
	lsls r5, r5, #7
	str r5, [sp]
	movs r0, #4
	adds r1, r4, #0
	movs r2, #0x18
	bl PutSprite
	ldr r3, _08096258 @ =0x08CC4F90
	str r5, [sp]
	movs r0, #4
	adds r1, r4, #0
	movs r2, #0x18
	bl PutSprite
	ldrb r7, [r7]
	lsls r0, r7, #1
	adds r6, #0x4c
	adds r6, r6, r0
	ldrh r1, [r6]
	ldr r0, _0809625C @ =0x02012466
	ldrh r2, [r0]
	movs r0, #0xb
	movs r3, #7
	bl UpdateMenuScrollBarConfig
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08096248: .4byte 0x02022860
_0809624C: .4byte 0x08407400
_08096250: .4byte 0x000002DA
_08096254: .4byte 0x08CC4FA0
_08096258: .4byte 0x08CC4F90
_0809625C: .4byte 0x02012466
