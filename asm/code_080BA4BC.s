	.include "macro.inc"

	.syntax unified

	thumb_func_start Title_InitBg
Title_InitBg: @ 0x080BA4BC
	push {lr}
	ldr r0, _080BA520 @ =0x0866AF6C
	movs r1, #0xf0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080BA524 @ =0x0866AF8C
	ldr r1, _080BA528 @ =0x06008000
	bl Decompress
	ldr r0, _080BA52C @ =0x02024460
	ldr r1, _080BA530 @ =0x0866EDC0
	movs r2, #0xf0
	lsls r2, r2, #8
	bl TmApplyTsa_thm
	ldr r0, _080BA534 @ =0x0866F274
	movs r1, #0xe0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080BA538 @ =0x0866F294
	ldr r1, _080BA53C @ =0x0600CC00
	bl Decompress
	ldr r0, _080BA540 @ =0x02023CA0
	ldr r1, _080BA544 @ =0x0866FB1C
	ldr r2, _080BA548 @ =0x0000E260
	bl sub_080AACD8
	ldr r0, _080BA54C @ =0x0866AB28
	movs r1, #0xd0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080BA550 @ =0x0866AB48
	ldr r1, _080BA554 @ =0x0600DE00
	bl Decompress
	ldr r0, _080BA558 @ =0x02023460
	ldr r1, _080BA55C @ =0x0866ADEC
	ldr r2, _080BA560 @ =0x0000D2F0
	bl sub_080AACD8
	pop {r0}
	bx r0
	.align 2, 0
_080BA520: .4byte 0x0866AF6C
_080BA524: .4byte 0x0866AF8C
_080BA528: .4byte 0x06008000
_080BA52C: .4byte 0x02024460
_080BA530: .4byte 0x0866EDC0
_080BA534: .4byte 0x0866F274
_080BA538: .4byte 0x0866F294
_080BA53C: .4byte 0x0600CC00
_080BA540: .4byte 0x02023CA0
_080BA544: .4byte 0x0866FB1C
_080BA548: .4byte 0x0000E260
_080BA54C: .4byte 0x0866AB28
_080BA550: .4byte 0x0866AB48
_080BA554: .4byte 0x0600DE00
_080BA558: .4byte 0x02023460
_080BA55C: .4byte 0x0866ADEC
_080BA560: .4byte 0x0000D2F0
