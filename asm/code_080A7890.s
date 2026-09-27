	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A7890
sub_080A7890: @ 0x080A7890
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	adds r0, #0xd
	lsls r0, r0, #5
	ldr r1, _080A78D8 @ =0x02022A62
	adds r5, r0, r1
	cmp r4, #0x40
	ble _080A78A4
	movs r4, #0x40
_080A78A4:
	ldr r0, _080A78DC @ =0x02000001
	ldrb r0, [r0]
	subs r0, #0xa
	lsls r0, r0, #1
	adds r4, r4, r0
	lsls r0, r2, #4
	ldr r1, _080A78E0 @ =0x0201E9F4
	subs r0, r0, r2
	movs r2, #0x1f
	mov ip, r2
	lsls r0, r0, #1
	adds r3, r0, r1
	movs r6, #0xe
_080A78BE:
	mov r0, ip
	ldrh r7, [r3]
	ands r0, r7
	muls r0, r4, r0
	asrs r0, r0, #6
	cmp r0, #0x1f
	bgt _080A78E4
	cmp r0, #0
	bge _080A78D2
	movs r0, #0
_080A78D2:
	mov r1, ip
	ands r1, r0
	b _080A78E6
	.align 2, 0
_080A78D8: .4byte 0x02022A62
_080A78DC: .4byte 0x02000001
_080A78E0: .4byte 0x0201E9F4
_080A78E4:
	movs r1, #0x1f
_080A78E6:
	movs r2, #0xf8
	lsls r2, r2, #2
	adds r0, r2, #0
	ldrh r7, [r3]
	ands r0, r7
	muls r0, r4, r0
	asrs r0, r0, #6
	cmp r0, r2
	bgt _080A7904
	cmp r0, #0
	bge _080A78FE
	movs r0, #0
_080A78FE:
	ands r0, r2
	adds r1, r1, r0
	b _080A7906
_080A7904:
	adds r1, r1, r2
_080A7906:
	movs r2, #0xf8
	lsls r2, r2, #7
	adds r0, r2, #0
	ldrh r7, [r3]
	ands r0, r7
	muls r0, r4, r0
	asrs r0, r0, #6
	cmp r0, r2
	bgt _080A7924
	cmp r0, #0
	bge _080A791E
	movs r0, #0
_080A791E:
	ands r0, r2
	adds r0, r1, r0
	b _080A7926
_080A7924:
	adds r0, r1, r2
_080A7926:
	strh r0, [r5]
	adds r5, #2
	adds r3, #2
	subs r6, #1
	cmp r6, #0
	bge _080A78BE
	bl EnablePalSync
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
