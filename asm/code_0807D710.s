	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807D710
sub_0807D710: @ 0x0807D710
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0807D75E
	movs r0, #0x85
	bl GetUnitFromCharId
	adds r4, r0, #0
	ldrb r0, [r4, #0xb]
	adds r0, #0x40
	strb r0, [r4, #0xb]
	bl RefreshUnitSprites
	ldrb r0, [r4, #0xb]
	subs r0, #0x40
	strb r0, [r4, #0xb]
	ldr r0, _0807D764 @ =0x02022C00
	adds r1, r0, #0
	subs r1, #0x40
	movs r2, #8
	bl CpuFastSet
	movs r0, #1
	bl ColorFadeSetupFromColorToWhite
	bl ColorFadeInit
	ldr r1, _0807D768 @ =0x02022240
	movs r0, #1
	strb r0, [r1, #0x1b]
	ldr r0, _0807D76C @ =0x08CBB48C
	adds r1, r5, #0
	bl Proc_Start
_0807D75E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807D764: .4byte 0x02022C00
_0807D768: .4byte 0x02022240
_0807D76C: .4byte 0x08CBB48C
