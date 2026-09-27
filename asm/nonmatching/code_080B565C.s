	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B565C
sub_080B565C: @ 0x080B565C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	cmp r0, #0
	ble _080B566C
	subs r0, #1
	str r0, [r4, #0x2c]
	b _080B575A
_080B566C:
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #0xc
	bhi _080B5754
	lsls r0, r0, #2
	ldr r1, _080B5680 @ =_080B5684
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080B5680: .4byte _080B5684
_080B5684: @ jump table
	.4byte _080B56B8 @ case 0
	.4byte _080B56C6 @ case 1
	.4byte _080B56CE @ case 2
	.4byte _080B56D8 @ case 3
	.4byte _080B56E0 @ case 4
	.4byte _080B56F6 @ case 5
	.4byte _080B570C @ case 6
	.4byte _080B571C @ case 7
	.4byte _080B572A @ case 8
	.4byte _080B573E @ case 9
	.4byte _080B5736 @ case 10
	.4byte _080B574E @ case 11
	.4byte _080B5746 @ case 12
_080B56B8:
	ldr r0, [r4, #0x34]
	ldr r1, [r4, #0x38]
	ldr r2, [r4, #0x3c]
	ldr r3, [r4, #0x44]
	bl sub_080B4904
	b _080B5754
_080B56C6:
	ldr r0, [r4, #0x34]
	bl EndWmMu
	b _080B5754
_080B56CE:
	ldr r0, [r4, #0x34]
	ldr r1, [r4, #0x40]
	bl StartWmSpriteAnim
	b _080B5754
_080B56D8:
	ldr r0, [r4, #0x34]
	bl EndWmSpriteAnim
	b _080B5754
_080B56E0:
	ldr r0, [r4, #0x34]
	movs r2, #0x38
	ldrsh r1, [r4, r2]
	movs r3, #0x3c
	ldrsh r2, [r4, r3]
	ldr r3, [r4, #0x44]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	bl StartWmIcon
	b _080B5754
_080B56F6:
	ldr r0, [r4, #0x34]
	movs r2, #0x38
	ldrsh r1, [r4, r2]
	movs r3, #0x3c
	ldrsh r2, [r4, r3]
	ldr r3, [r4, #0x44]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	bl StartWmIcon2
	b _080B5754
_080B570C:
	ldr r0, [r4, #0x34]
	ldr r1, [r4, #0x40]
	ldr r2, [r4, #0x44]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	bl sub_080B4D4C
	b _080B5754
_080B571C:
	ldr r0, [r4, #0x34]
	ldr r1, [r4, #0x44]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl sub_080B4E88
	b _080B5754
_080B572A:
	ldr r0, [r4, #0x38]
	ldr r1, [r4, #0x3c]
	ldr r2, [r4, #0x44]
	bl sub_080B4F9C
	b _080B5754
_080B5736:
	ldr r0, [r4, #0x44]
	bl sub_080B5844
	b _080B5754
_080B573E:
	ldr r0, [r4, #0x44]
	bl sub_080B5934
	b _080B5754
_080B5746:
	ldr r0, [r4, #0x44]
	bl WmMu_EndFlash
	b _080B5754
_080B574E:
	ldr r0, [r4, #0x44]
	bl WmMu_StartFlash
_080B5754:
	adds r0, r4, #0
	bl Proc_Break
_080B575A:
	pop {r4}
	pop {r0}
	bx r0
