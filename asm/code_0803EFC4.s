	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803EFC4
sub_0803EFC4: @ 0x0803EFC4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x58]
	lsls r1, r1, #3
	adds r1, #0x18
	movs r0, #0x60
	bl PutLinkArenaChoiceBannerSprite
	ldr r0, _0803F068 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x20
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0803EFF6
	adds r1, r4, #0
	adds r1, #0x55
	ldrb r0, [r1]
	cmp r0, #1
	bne _0803EFF6
	movs r0, #0
	strb r0, [r1]
	movs r0, #3
	bl SioPlaySoundEffect
_0803EFF6:
	ldr r0, _0803F068 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x10
	ldrh r1, [r1, #8]
	ands r0, r1
	adds r5, r4, #0
	adds r5, #0x55
	cmp r0, #0
	beq _0803F018
	ldrb r0, [r5]
	cmp r0, #0
	bne _0803F018
	movs r0, #1
	strb r0, [r5]
	movs r0, #3
	bl SioPlaySoundEffect
_0803F018:
	ldrb r1, [r5]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #0x70
	ldr r1, [r4, #0x58]
	lsls r1, r1, #3
	adds r1, #0x20
	bl PutUiHand
	ldr r0, _0803F068 @ =0x08B857F8
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803F070
	movs r0, #1
	bl SioPlaySoundEffect
	ldr r0, [r4, #0x30]
	bl Proc_End
	ldr r0, [r4, #0x58]
	adds r0, #4
	lsls r0, r0, #6
	ldr r1, _0803F06C @ =0x02022C7E
	adds r0, r0, r1
	movs r1, #0xc
	movs r2, #2
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #1
	bl EnableBgSync
	adds r0, r4, #0
	bl Proc_Break
	b _0803F0B8
	.align 2, 0
_0803F068: .4byte 0x08B857F8
_0803F06C: .4byte 0x02022C7E
_0803F070:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0803F0B8
	ldr r0, [r4, #0x30]
	bl Proc_End
	ldrb r0, [r5]
	cmp r0, #0
	bne _0803F092
	adds r0, r4, #0
	bl sub_0803E184
	movs r0, #2
	bl SioPlaySoundEffect
	b _0803F098
_0803F092:
	movs r0, #1
	bl SioPlaySoundEffect
_0803F098:
	ldr r0, [r4, #0x58]
	adds r0, #4
	lsls r0, r0, #6
	ldr r1, _0803F0C0 @ =0x02022C7E
	adds r0, r0, r1
	movs r1, #0xc
	movs r2, #2
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #1
	bl EnableBgSync
	adds r0, r4, #0
	bl Proc_Break
_0803F0B8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803F0C0: .4byte 0x02022C7E
